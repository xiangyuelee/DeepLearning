clear all;
X = zeros(5,5,5);
rng(3);
X(:,:,1) = [0 1 1 0 0;
            0 0 1 0 0;
            0 0 1 0 0;
            0 0 1 0 0;
            0 1 1 1 0];
X(:,:,2) = [1 1 1 1 0;
            0 0 0 0 1;
            0 1 1 1 0;
            1 0 0 0 0;
            1 1 1 1 1];
X(:,:,3) = [1 1 1 1 0;
            0 0 0 0 1;
            0 1 1 1 0;
            0 0 0 0 1;
            1 1 1 1 0];
X(:,:,4) = [0 0 0 1 0;
            0 0 1 1 0;
            0 1 0 1 0;
            1 1 1 1 1;
            0 0 0 1 0];
X(:,:,5) = [1 1 1 1 1;
            1 0 0 0 0;
            1 1 1 1 0;
            0 0 0 0 1; 
            1 1 1 1 0];

D = [ 1 0 0 0 0;
      0 1 0 0 0;
      0 0 1 0 0;
      0 0 0 1 0;
      0 0 0 0 1];

W1 = 2 * rand(50, 25) - 1;
W2 = 2 * rand(5, 50) - 1;

for epoch = 1:10000
    [W1 W2] = MultiClassNumber(W1, W2, X, D);
end

N = 5;
X(:,:,1) = [0 0 1 1 0;
            0 0 1 1 0;
            0 1 0 1 0;
            0 0 0 1 0;
            0 1 1 1 0];
X(:,:,2) = [1 1 1 1 0;
            0 0 0 0 1;
            0 1 1 1 0;
            1 0 0 0 1;
            1 1 1 1 1];
X(:,:,3) = [1 1 1 1 0;
            0 0 0 0 1;
            0 1 1 1 0;
            1 0 0 0 1;
            1 1 1 1 0];
X(:,:,4) = [0 1 1 1 0;
            0 1 0 0 0;
            0 1 1 1 0;
            0 0 0 1 0;
            0 1 1 1 0];
X(:,:,5) = [0 1 1 1 1;
            0 1 0 0 0;
            0 1 1 1 0;
            0 0 0 1 0; 
            1 1 1 1 0];

for k = 1:N
    x = reshape(X(:,:,k), 25,1);
    v1 = W1 * x;
    y1 = Sigmoid(v1);
    v2 = W2 * y1;
    y2(:,k) = Softmax(v2);
end

disp(y2')


