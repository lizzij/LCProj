# train the prediction model
python -m train --dataset=sat1
python -m train --dataset=sat2
python -m train --dataset=sat4
python -m train --dataset=sat5


# train the explainer
python -m explainer_main --explain-node=300 --dataset=sat1  # change explain-node to 301, 302, etc. (basis graph is of size 300)
python -m explainer_main --explain-node=350 --dataset=sat2  # (basis graph is of size 350, first 2 feature dimensions were useful features, the rest are uninformative)
python -m explainer_main --explain-node=512 --dataset=sat4  # change explain-node to 512, etc.(basis tree is of size 512)
python -m explainer_main --explain-node=512 --dataset=sat5  # (basis tree is of size 512)
