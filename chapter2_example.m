clc; clear all; close all

A = [0 1 0 0 0; 1 0 1 1 0; 0 1 0 1 1; 0 1 1 0 1; 0 0 1 1 0];
x = [2; 5; 8; 3; 1];

y = A*x
one = ones(size(x))
D = diag(A*one)
D_inv = inv(D)

Q = D_inv * A
y1 = Q * x

I = eye(size(Q));
tau = I - Q