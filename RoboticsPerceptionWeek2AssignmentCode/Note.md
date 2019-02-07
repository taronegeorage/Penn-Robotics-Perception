1. SVD and Linear Least Square

Solve linear funvtions Ax = b.    
Matrix decomposition are used to improve efficiency and reduce space cost.    
Method: LU decomposition, QR decomposition, Cholesky decomposition, Schur decomposition, Eigen value decomposition (EVD), Singular value decomposition (SVD)...   

SVD:   
The SVD decomposition of A matrix (any m*n matrix): A = USV'   
U - m*m orthogonal matrix   
S - m*n diagonal matrix   
V - n*n orthogonal matrix   
The diagnal in the S matrix is the sigular value of A'A, in decreasing order.    
U is the eigen vector of AA', V is the eigen vector of A'A,    
We can use the first r sigular value to approach the original matrix.   
A ~ U * S * V',  where U (m*r), S(r*r), V(r*n).

Linear Least Square:
min ||Ax - b||2   
A ∈ R m*n, x ∈ R n, b ∈ R m   
There are m functions and n unknowns,    
if m = n and A is nonsingular, there is only one solution, x = b / A   
if m < n, underdetermined   
if m > n, (most cases) and overdetermined, least square, x = A'b / (A'A)   


