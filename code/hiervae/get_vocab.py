import sys
from hgraph import *
from rdkit import Chem
from multiprocessing import Pool

def process(data):
    #print("peter: begin process() data: ", data)
    vocab = set()
    for line in data:
        s = line.strip("\r\n ")
        hmol = MolGraph(s)
        for node,attr in hmol.mol_tree.nodes(data=True):
            smiles = attr['smiles']
            vocab.add( attr['label'] )
            for i,s in attr['inter_label']:
                vocab.add( (smiles, s) )
    #print("vocab: ", vocab)
    #print(len(vocab))
    return vocab

if __name__ == "__main__":
    #print("peter: begin get_vocab()")
    data = [mol for line in sys.stdin for mol in line.split()[:2]]
    #print("data: ", data)
    data = list(set(data))
    #print("list data: ", data)
    ncpu = 15
    batch_size = len(data) // ncpu + 1
    #print(ncpu, len(data), batch_size)
    batches = [data[i : i + batch_size] for i in range(0, len(data), batch_size)]

    pool = Pool(ncpu)
    vocab_list = pool.map(process, batches)
    vocab = [(x,y) for vocab in vocab_list for x,y in vocab]
    vocab = list(set(vocab))

    for x,y in sorted(vocab):
        print(x, y)
