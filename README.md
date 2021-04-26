# Explainable Graph Neural Networks on Boolean Satisfiability Problem

## Setup
### Generate SAT
Make sure to have `minisat` in `/sat`. It is available at [the MiniSat Page](http://minisat.se/MiniSat.html).

Create the required environment by running the following commands:
- `cd sat`
- `conda env create -f cnfgen.yaml`

Generate the data used for training by activating the env and running the generation script:
- `conda activate cnfgen`
- `scripts/generate_mixed.sh`
- `(cd code/PyMiniSolvers && make)`

SATs in CNF are now generated in the `sat/data` dir.

Deactivate the conda environment with `conda deactivate`.

### Install explainer
Navigate to GNN model explainer dir `/explainer`.

It is recommended to run this code inside a `virtualenv` with `python3.7`.
```
virtualenv venv -p /usr/local/bin/python3
source venv/bin/activate
```

Install the requirements by running the following commands:
```
python -m pip install -r requirements.txt
```

## Usage
### Training a GCN model
To train a model using the default SAT dataset `sat1`, run the following:
```
python train.py
```

To train a model using a specific SAT dataset run the following:
```
python train.py --dataset=EXPERIMENT_NAME
```
where `EXPERIMENT_NAME` is `sat1` to `sat5`.


### Visualizing the explanations
The result of the optimization can be visualized through Tensorboard.
```
tensorboard --logdir log
```
You should then have access to visualizations served from `localhost`.


## References
- `GNNExplainer: Generating Explanations for Graph Neural Networks` by [Rex Ying](https://cs.stanford.edu/people/rexy/), [Dylan Bourgeois](https://dtsbourg.me/), [Jiaxuan You](https://cs.stanford.edu/~jiaxuan/), [Marinka Zitnik](http://helikoid.si/cms/) & [Jure Leskovec](https://cs.stanford.edu/people/jure/), presented at [NeurIPS 2019](nips.cc).

[[Arxiv]](https://arxiv.org/abs/1903.03894) [[BibTex]](https://dblp.uni-trier.de/rec/bibtex/journals/corr/abs-1903-03894) [[Google Scholar]](https://scholar.google.com/scholar?q=GNNExplainer%3A%20Generating%20Explanations%20for%20Graph%20Neural%20Networks%20Rex%20arXiv%202019)

- [*Learning local search heuristics for Boolean satisfiability*](https://papers.nips.cc/paper/9012-learning-local-search-heuristics-for-boolean-satisfiability) by Emre Yolcu, Barnabas Poczos, presented at [NeurIPS 2019](nips.cc).
