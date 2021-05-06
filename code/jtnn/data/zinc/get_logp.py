import rdkit
import rdkit.Chem as Chem
from rdkit.Chem import Descriptors
import sascorer


def logp(s):
    if s is None: return 0.0
    mol = Chem.MolFromSmiles(s)
    if mol is None: return 0.0
    score = Descriptors.MolLogP(mol) - sascorer.calculateScore(mol)
    return score


with open('valid.logp.txt', 'r') as f:
    with open('opt.valid.logp_new', 'w') as w:
        for line in f:
            w.write(line.split()[0]+' '+str(logp(line.split()[0]))+'\n')
