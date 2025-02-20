% Write a matrix that spells out "hello"
A = [
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 1 0 0 1 1 0 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 1 0 0 1 1 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 1 1 1 1 1 1 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0;
    0 1 1 0 0 1 1 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 1 1 1 1 0;
    0 1 1 0 0 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 1 1 0;
    0 1 1 0 0 1 1 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 1 1 0;
    0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 1 1 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1 1 0 0 1 1 0 0 1 1 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0 0 1 1 1 1 1 1 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
];

% spy(A);

% Call SVD to computer the singular value of A. What is the rank of A?

[U,S,V] = svd(A); 


%plot(S)
figure;
tiledlayout('flow');


nexttile
semilogy(diag(S))
title("Semilogy")
nexttile
plot(diag(S))
title("Plot")

rank(A);

% for each i from 1 to rank(A), construct the rank i matrix that is the best approximation for A in the 2 norm. 

for i = 1:10 
    sigma = zeros(i,i);
    sigma(1:i,1:i) = S(1:i,1:i); %singular vals 
    I = zeros(14,i); %first i cols of U
    I(:, 1:i) = U(:, 1:i);
    J = zeros(40,i);
    J(:,1:i) = V(:, 1:i);
    B = I*sigma*J.';
    nexttile
    pcolor(B)
    set(gca, "XAxisLocation", "top", "YAxisLocation", "left", "ydir", "reverse");
    title(gca, sprintf('Rank %d', i));
    colormap(gray)
end

diag(S) %singular vals


