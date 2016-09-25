%data = blobs'; 
%clear; 
numofpoints = 500; 
mu = [2, 3];
sigma = eye(2);
set1 = mvnrnd(mu,sigma, numofpoints);
mu = [4, 13];
set2 = mvnrnd(mu,sigma, numofpoints);
mu = [14, -1];
set3 = mvnrnd(mu,sigma, numofpoints);
mu = [-14, -1];
set4 = mvnrnd(mu,sigma, numofpoints);
mu = [-14, -10];
set5 = mvnrnd(mu,sigma, numofpoints);

data = [set1; set5; set2; set3; set4];%; ; ];

figure(1) 
plot(data(:,1), data(:,2), '.')

data = sizevec; 
K = 15; %totalNumOfClusters
y = 1; 
D = zeros(K, 1); 
D(1) = inf; 

for n=2:K
    [idx, C] = kmeans(data, n); 
    
    % Sort the data 
    
   
    for m=1:n % For each cluster 
        
        clusterpoints = data(idx == m, :); 
        distance_vec(m) = mean(pdist2(clusterpoints, C(m, :))); 
        %distance_vec(m) = mahal(C(m, :), data(idx==m, :))
        %distance_vec(m) = (mahal(C(m, :), data))^2;  
    end 
    D(n) = mean(distance_vec);  
end 
figure(2) 
plot(D(2:end))
% Calculate jumps 
for n=2:K
    j(n) = (D(n)^(-y) - D(n - 1)^(-y));
end 

plot(j)

[~, ind] = max(j)
