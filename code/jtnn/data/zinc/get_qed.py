from rdkit import Chem
from rdkit.Chem import QED


def qed(s):
    if s is None: return 0.0
    mol = Chem.MolFromSmiles(s)
    if mol is None: return 0.0
    return QED.qed(mol)



with open('train.txt', 'r') as f:
    with open('train.qed', 'w') as w:
        for line in f:
            w.write(str(qed(line.split()[0]))+'\n')
