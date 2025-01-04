% Consider A_j x - b_j, and implement Jacobi and Gauss-Seidel on the examples. b is a unit vector. 

clear all

A1 = [3, 0, 4; 7, 4, 2; -1, 1, 2];
b1 = [7; 13; 2];

[sol1j, iter1j] = jacobi_iter(A1,b1, 1);
[sol1g, iter1g] = gauss_seidel(A1, b1, 1.2);

A2 = [-3, 3, -6; -4, 7, -8; 5, 7, -9];
b2 = [-6; -5; 3];

[sol2j, iter2j] = jacobi_iter(A2, b2, .00005);
[sol2g, iter2g] = gauss_seidel(A2, b2, 0.00005);

A3 = [4,1,1; 2,-9,0; 0,-8,-6];
b3 = [6;-7;-14];

[sol3j, iter3j] = jacobi_iter(A3, b3, .00005);
[sol3g, iter3g] = gauss_seidel(A3, b3, .00005);

A4 = [7,6,9; 4,5,-4; -7,-3,8];
b4 = [22;5;-2];

[sol4j, iter4j] = jacobi_iter(A4, b4, .0000005);
[sol4g, iter4g] = gauss_seidel(A4, b4, .000005);

A5 = [50, 1, 2; 4, 75, 6; 8, 10, -90];
b5 = A5*[1;1;1];

[sol5j, iter5j] = jacobi_iter(A5, b5, .0000005);
[sol5g, iter5g] = gauss_seidel(A5, b5, .0000005);


compile_matricesj = [sol1j.', sol2j.', sol3j.', sol4j.', sol5j.'; iter1j, iter2j, iter3j, iter4j, iter5j];
a2tj = array2table(compile_matricesj,"VariableNames",["A1", "A2", "A3","A4", "A5"], "RowNames",["Solution (Entry 1)", "Solution (Entry 2)", "Solution (Entry 3)", "Iterations"])


% subject = [sol1j.'; sol2j.'; sol3j.'; sol4j.'; sol5j.'];
% condition = {'cond1';'cond2';'cond3';'cond4';'cond5'};
% data = cell(5,1);
% T = table(subject,condition,data);
% % populate the table with matrixes, using a for loop
% for i = 1:1:size(T,1)
%     data = rand(10,5);
%     T.data{i} = data; 
% end    
% 

compile_matricesg = [sol1g, sol2g, sol3g, sol4g, sol5g; iter1g, iter2g, iter3g, iter4g, iter5g];
a2tg = array2table(compile_matricesg,"VariableNames",["A1", "A2", "A3","A4", "A5"], "RowNames",["Solution (Entry 1)", "Solution (Entry 2)", "Solution (Entry 3)", "Iterations"])







