function [Y] = rms(X, dim)
funcprot(0);


// Calling Sequence
//	Y=rms(X)
//	Y=rms(X,dim)
// Parameters
//	X: Real or complex valued input vector or matrix. 
//	dim: Dimension to compute maximum-to-minimum difference (Row/Column)
// Description
//	Y=rms(X) returns the root-mean-square (RMS) level of the input X. For matrices, Y contains RMS levels computed along the first
//	non singleton dimension.
//	Y=rms(X,dim) computes root-mean-square (RMS) level of X along the dimension X
// Examples
// 1.	a= 1:0.01:2;
//	y= rms(a)
//	y= 1.5280707
// 2.	b= [1 2 3;4 5 6];
//	z= rms(b)
//	z= [2.9154759    3.8078866    4.7434165]
// 3.	x= rms(b,2)
//	z= [ 2.1602469 ; 5.0662281 ]
// Authors
// 	Rahul Dalmia


[nr, nc] = size (X);				// Dimensions of Input argument calculated
if (~exists('dim','local')) then
	if (nr==1) then				// For row vector
		X= X.^2;
		s=sum(X(1,:));			// Sum of squares of all elements in row
		n=s/nc;
		Y=sqrt(n);			// RMS of entire row
	elseif (nc==1)				// For column vector
		X= X.^2;
		s=sum(X(:,1));			// Sum of squares of all elements in column
		n=s/nr;
		Y=sqrt(n);			// RMS of entire column
	else
		s = zeros(1,nc);		// For Matrix
		X=X.^2;
		for i=1:nc
			s=sum(X(:,i));		// Sum of squares of elements of column
			n=s/nr;
			Y(1,i)=sqrt(n);		// RMS of each column
		end
	end
else
	if (dim==1) then
		s = zeros(1, nc);		// For RMS along the column
		X= X.^2;
		for i= 1:nc
			s=sum(X(:,i));		// Sum of squares of elements of column
			n=s/nr;
			Y(1,i)=sqrt(n);		// RMS of each column
		end
	elseif (dim==2) then
		output = zeros(nr, 1);		// For RMS along the row
		X= X.^2;
		for i= 1:nr
			s=sum(X(i,:));		// Sum of squares of elements of row
			n=s/nc;
			Y(i,1)=sqrt(n);		// RMS of each row
		end
	end
end
endfunction
