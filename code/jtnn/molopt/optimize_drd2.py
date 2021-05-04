import torch
import torch.nn as nn
from torch.autograd import Variable

import math, random, sys
from optparse import OptionParser
from collections import deque

import rdkit
import rdkit.Chem as Chem
from rdkit.Chem import Descriptors
import sascorer

from jtnn import *
"""Scores based on an ECFP classifier for activity."""

clf_model = None
def load_model():
    global clf_model
    name = op.join(op.dirname(__file__), 'clf_py27.pkl')
    with open(name, "rb") as f:
        clf_model = pickle.load(f)

def get_score(smile):
    if clf_model is None:
        load_model()

    mol = Chem.MolFromSmiles(smile)
    if mol:
        fp = fingerprints_from_mol(mol)
        score = clf_model.predict_proba(fp)[:, 1]
        return float(score)
    return 0.0

def fingerprints_from_mol(mol):
    fp = AllChem.GetMorganFingerprint(mol, 3, useCounts=True, useFeatures=True)
    size = 2048
    nfp = np.zeros((1, size), np.int32)
    for idx,v in fp.GetNonzeroElements().items():
        nidx = idx%size
        nfp[0, nidx] += int(v)
    return nfp

lg = rdkit.RDLogger.logger() 
lg.setLevel(rdkit.RDLogger.CRITICAL)

parser = OptionParser()
parser.add_option("-t", "--test", dest="test_path")
parser.add_option("-v", "--vocab", dest="vocab_path")
parser.add_option("-m", "--model", dest="model_path")
parser.add_option("-w", "--hidden", dest="hidden_size", default=200)
parser.add_option("-l", "--latent", dest="latent_size", default=56)
parser.add_option("-d", "--depth", dest="depth", default=3)
parser.add_option("-s", "--sim", dest="cutoff", default=0.0)
opts,args = parser.parse_args()
   
vocab = [x.strip("\r\n ") for x in open(opts.vocab_path)] 
vocab = Vocab(vocab)

hidden_size = int(opts.hidden_size)
latent_size = int(opts.latent_size)
depth = int(opts.depth)
sim_cutoff = float(opts.cutoff)

model = JTPropVAE(vocab, hidden_size, latent_size, depth)
model.load_state_dict(torch.load(opts.model_path))
model = model.cuda()

data = []
with open(opts.test_path) as f:
    for line in f:
        s = line.strip("\r\n ").split()[0]
        data.append(s)

res = []
for smiles in data:
    mol = Chem.MolFromSmiles(smiles)
    score = get_score(mol)

    new_smiles,sim = model.optimize(smiles, sim_cutoff=sim_cutoff, lr=2, num_iter=80)
    new_mol = Chem.MolFromSmiles(new_smiles)
    new_score = get_score(new_mol)

    res.append( (new_score - score, sim, score, new_score, smiles, new_smiles) )
    print new_score - score, sim, score, new_score, smiles, new_smiles

print sum([x[0] for x in res]), sum([x[1] for x in res])
