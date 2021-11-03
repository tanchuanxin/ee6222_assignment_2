# l - physical distance in mm between center points of two crosses
# d - physical distance in mm from camera lens to center point between two crosses
# h - distance in pixels between center points of two crosses in the image

l = 1.2 * 1000

# image 1: closer image : q1_img1
d1 = 1.24 * 1000 
h1 = 1111 - 157

# image 2: farther image : q1_img2
d2 = 1.80 * 1000
h2 = 925 - 273


# method 1
# using the formula 
focal_length = (h1 / l * d1 - h2 / l * d2) / (h1 / l - h2 / l)
print("focal length: ", focal_length)


pixel_focal_length = h1 / l * d1 - h1 / l * focal_length
print("pixel focal length: ", pixel_focal_length)


# method 2  
# using the formula : h/H = f/L
print(h1 / l * d1)
print(h2/l*d2)
