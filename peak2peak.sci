function [Y] = peak2peak(X, dim)
funcprot(0);

// peak2peak finds the maximum-to-minimum difference
// Calling Sequence
//	Y=peak2peak(X)
//	Y=peak2peak(X,dim)
// Parameters
//	X: Real or complex valued input vector or matrix. 
//	dim: Dimension to compute maximum-to-minimum difference (Row/Column)
// Description
//	Y= peak2peak(X) returns the difference between maximum and minimum values in X, operating along the first non-singleton
//	dimension of X by default. 
//	Y= peak2peak(X,dim) returns the maximum-to-minimum difference in X, along dimension dim.
// Examples
//  1.  t = 0:0.001:1-0.001;
//	x = cos(2*pi*100*t);
//	y = peak2peak(x)
//  2.  t = 0:0.001:1-0.001;
//	x = (1:4)'*cos(2*pi*100*t);
//	y = peak2peak(x,2)
// Authors
// 	Rahul Dalmia

[nr, nc] = size (X);			 // Dimensions of Input calculated

if (~exists('dim','local')) then
	if (nr==1) then
		Y = zeros(nr, 1); 			 // preset all output fields to 0
		for i= 1:nr
			maxim=max(X(i,:));		 // maximum and minimum values are found
			minim=min(X(i,:));
			Y(i,1)=maxim-minim;		 // Peak to peak value is calculated from the difference of max and min
		end
	else 
		Y = zeros(1, nc); 			 // preset all output fields to 0
		for i= 1:nc
			maxim=max(X(:,i));		 // maximum and minimum values are found
			minim=min(X(:,i));
			Y(1,i)=maxim-minim;		 // Peak to peak value is calculated from the difference of max and min
		end
	end

elseif (exists('dim','local')) then
	if (dim==1) then
		Y = zeros(1, nc); 			 // preset all output fields to 0
		for i= 1:nc
			maxim=max(X(:,i));		 // maximum and minimum values are found
			minim=min(X(:,i));
			Y(1,i)=maxim-minim;		 // Peak to peak value is calculated from the difference of max and min
		end

	elseif (dim==2) then 
		Y = zeros(nr, 1); 			 // preset all output fields to 0
		for i= 1:nr
			maxim=max(X(i,:));		 // maximum and minimum values are found
			minim=min(X(i,:));
			Y(i,1)=maxim-minim;		 // Peak to peak value is calculated from the difference of max and min
		end
	end
end

endfunction
