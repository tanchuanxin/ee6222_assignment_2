% Focal length in pixels
F=961;
 
% Eight corresponding points of two images
pts1 = [[129 322]; [544 1127]; [225 133]; [335 168]; [380 341]; [210 738]; [210 748]; [224 738];];
pts2 = [[304 318]; [725 1106]; [390 114]; [499 137]; [544 309]; [385 708]; [386 717]; [399 708];];

% Center coordinates of image
X0 = 960/2;
Y0 = 1280/2;

% First image
X = [pts1 ones(8,1)*F];
X (: ,1) = X (: ,1) - X0 ;
X (: ,2) = X (: ,2) - Y0 ;

% Second image
P = [pts2 ones(8,1)*F];
P (: ,1) = P (: ,1) - X0 ;
P (: ,2) = P (: ,2) - Y0 ;

% Obtain the L2 norm along each row
X_norm = vecnorm (X , 2 , 2) ;
% Row - wise devision of vector with its norm
X = X ./ X_norm ;

% Likewise for P
P_norm = vecnorm (P , 2 , 2) ;
P = P ./ P_norm ;

% Creating W matrix
W = zeros (3 ,3) ;
for i = 1:8
temp = transpose ( X (i ,:) ) * P (i ,:) ;
W = W + temp ;
end

% SVD approach
[U , S , V ] = svd( W ) ;
R = U * transpose ( V ) ;
angle = acos((trace(R)-1)/2);
rad2deg(angle);

% angle = 10.2375 degrees;