% Focal length in pixels
F=961;
 
% Eight corresponding points of two images
pts1 = [[129 322]; [544 1127]; [225 133]; [335 168]; [380 341]; [210 738]; [210 748]; [224 738];];
pts2 = [[304 318]; [725 1106]; [390 114]; [499 137]; [544 309]; [385 708]; [386 717]; [399 708];];

% Center coordinates of image
x_center = 960/2;
y_center = 1280/2;

% Obtaining N-vectors
image1_points = [pts1 ones(8,1)*F];
image1_points(: ,1) = image1_points (: ,1) - X0 ;
image1_points (: ,2) = image1_points (: ,2) - Y0 ;
image1_norm = vecnorm (image1_points , 2 , 2) ;
image1_points = image1_points ./ image1_norm ;

image2_points = [pts2 ones(8,1)*F];
image2_points (: ,1) = image2_points (: ,1) - X0 ;
image2_points (: ,2) = image2_points (: ,2) - Y0 ;
image2_norm = vecnorm (image2_points , 2 , 2) ;
image2_points = image2_points ./ image2_norm ;

% Creating W matrix
weight_matrix = zeros (3 ,3) ;
for i = 1:8
temp = transpose ( image1_points (i ,:) ) * image2_points (i ,:) ;
weight_matrix = weight_matrix + temp ;
end

% SVD approach
[U , S , V ] = svd( W ) ;
rotational_matrix = U * transpose ( V ) ;
angle = acos((trace(rotational_matrix)-1)/2);
rad2deg(angle)

% angle = 10.2375 degrees;