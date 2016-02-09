function [Ix,Iy] = compute_gradient(I)
  hy = 1/2 * [1, 2, 1]';
  hx = 1/2 * [-1, 0, 1];
  

  Ix = convolution_separable(I,hx,hy);
  Iy = convolution_separable(I,hy',hx');

end

