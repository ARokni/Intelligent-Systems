# Second Project


 In this project I have implemented **`Decision Tree`**, **`KNN`**, and **`K-Means Clustring`** on **`MATLAB`** from scratch.


 # Decision Tree

 * The **first problem** of this project is mainly focused on **`Letter Recognition`** utilizing a **Decision Tree**.

 * In the **firts part** of this problem, I have implemented a tree uitilizing **`ID3`** algorithm. Then by splitting the data to **Train** and **Test**, first I trained the tree on **Training Data**, then I evaluated the tree on **Test Data**. Moreover, I provie te **`confusion matrix`** to evaluate the tree performance in details.

 * Since the **Letter Recognition** problem is a **Multy-Category** problem, I employed the **One VS all** policy to train the tree((Infact, I trained 26 trees seperately, the same number fo total letters).

* In the **second part** of this problem, I utilized **ID3** algorithm with **`Gini Index`**.

* In the **third part** of this problem, I applied some strategies in order to cope with the **`Overfitting Problem`**.

* In the **fourth part** of this problem, I have implemented a **`Random Forest`** model.

## Codes

* The main codes of the **first part** are provided in [P1_main](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/P1_main.m) and the **MATLAB Function** for the **ID3** algorithm is provided in [P1c_ID3](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/P1c_ID3.m).

* The main codes of the **second part** are provided in [P1_Tree_GINI](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/P1_Tree_GINI.m) and the **MATLAB Function** for the **ID3 with Gini Index** algorithm is provided in [ID3_GINI](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/ID3_by_GINI.m).

* The main codes of the **third part** are provided in [P1_Tree_OverfitID3](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/P1_Tree_OverfitID3.m) and the **MATLAB Function** for the **ID3 with Overfitting Mechanism** algorithm is provided in [ID3_overfit](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/ID3_overfit.m).

* The main codes of the **fourth part** are provided in [P1_Radom_Forest](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem1/P1_Radom_Forest.m).


# KNN

* In the **second problem** of this project, I implemented **`KNN`** algorithm on **`iris`** dataset.

* I applied **`6-Folded Cross Validation`** in order to provide an accurate evaluation.

* I utilized two different norms in the **KNN** implementation: **`L2 Norm`** and **`Cosine Similarities`**.


## Codes

* The main codes of the **KNN with L2 Norm** are provided in [Hw2_P2_L2Norm](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem2/Hw2_P2_3fold.m).

* The main codes of the **KNN with Cosine Similarities** are provided in [Hw2_P2_cos](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem2/knn_3fold_cos.m).


# K-Means Clustring

* In the **third problem** of this project, I implemented **`K-Means Clustring`** on **`iris`** dataset.

## Codes

* The main codes of the **KNN with L2 Norm** are provided in [Hw2_P3_K_Means_Clustring](https://github.com/ARokni/Intelligent-Systems/blob/main/2/Codes/Problem3/Hw2_P3_cell.m).







 