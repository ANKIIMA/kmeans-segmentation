function [A_new,label] = kmean_func(A,K)
A = double(A);
Ar = A(:,:,1);
Ag = A(:,:,2);
Ab = A(:,:,3);

[m,n] = size(Ar);

r = zeros(1,K);
g = zeros(1,K);
b = zeros(1,K);
for i=1:K
    r(i) = A(randi([1,m],1),randi([1,n],1),1);
    g(i) = A(randi([1,m],1),randi([1,n],1),2);
    b(i) = A(randi([1,m],1),randi([1,n],1),3);
end


label = zeros(m,n);

for k = 1:100
    for i = 1:m
        for j = 1:n
            temp_value = 0;
            for dis = 1:K
                value = (Ar(i,j)-r(dis))^2 + (Ag(i,j)-g(dis))^2 + (Ab(i,j)-b(dis))^2;
                if temp_value == 0 || temp_value>value
                    temp_value = value;
                    label(i,j) = dis;
                end
            end
        end
    end
    
    for i = 1:K
        r(i) = mean(Ar(label == i));
        g(i) = mean(Ag(label == i));
        b(i) = mean(Ab(label == i));
    end
    
end


A_new = zeros(m,n,3);
for i=1:m
    for j=1:n
        A_new(i,j,1) = r(label(i,j));
        A_new(i,j,2) = g(label(i,j));
        A_new(i,j,3) = b(label(i,j));
    end
end

A_new = uint8(A_new);
end
