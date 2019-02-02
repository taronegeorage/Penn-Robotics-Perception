
If MATLAB prompts something related to "out of range ...", it is super likely that there is some wrong with your est_homography function.
In order to estimate H matrix, SVD is applied to matrix A in the linear homogeneous equations. H is the last column of V.
H should be something like this H = [h(1) h(2) h(3);h(4) h(5) h(6);h(7) h(8) h(9)];
However, if invoke the reshape(H, 3, 3) function, you also need to transpose it as the result is [h(1) h(4) h(7);h(2) h(5) h(8);h(3) h(6) h(9)].
