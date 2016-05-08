im = imread ("image1.tif");
imshow (im)
disp(maximum pixel)
max(max(im))
disp(minimum pixel)
min(min(im))
function conv(p,q)
	[X,mat1] = size(p);
	[X,mat2] = size(q);

	conv=[];
	l = mat1+mat2;
	for i = 1:l
	value = 0;
	start=max(1, (i-mat2));
		k = min(i-1,(mat1));
		for j = start:(k)
			pi = pi + (p(j) * q(i-j));
		end
	conv(i)=pi;
	end
	disp(conv(2:end))
endfunction

function ft(p)
	[y,l] = size(p);
	v = complex(0,-1);
	con = (2*pi*v)/(l);
	for i = 0:l-1
		k = 0;
		for j = 0:l-1
			k = k + p(j+1) * exp(con*i*j);
			k = complex(real(k),imag(k));
		end
		ftran(i+1)=k;
	end
	disp(ftran)
endfunction

function convv(p,q)
	[X,l1] = size(p);
	[X,l2] = size(q);
	l = l1 + l2 - 1;

	for i=l1+1:l
		p(i) = 0;
	end
	for i=l2+1:l
		 q(i) = 0;
	end
	disp ((ifft(fft(p).*fft(q))))
endfunction

function noise()
	pkg load image
	im2 = imread("image2.tif");
	g =  imnoise (im, "gaussian", 0, 0.01)
	imshow(g)
endfunction

function filters()
	im=imread("image1.tif");
	img = imnoise(im, 'gaussian', 0.05 , 0.1);
	avgf3 = fspecial('average', [3 3]);
	avgf5 = fspecial('average', [5 5]);
	linf = imfilter(img, avgf3);
	linf5 = imfilter(img, avgf5);
	med3 = medfilt2(img, [3 3]);
	med5 = medfilt2(img, [5 5]);
	or3 = ordfilt2(img, 1, true(3));
	or5 = ordfilt2(img, 1, true(5));
	or33 = ordfilt2(img, 3*3, true(3));
	or55 = ordfilt2(img, 5*5, true(5));
	subplot(2,5,1), subimage(img)
	subplot(2,5,2), subimage(linf5); 
	subplot(2,5,3), subimage(linf);
	subplot(2,5,4), subimage(med3); 
	subplot(2,5,5), subimage(med5); 
	subplot(2,5,6), subimage(or3); 
	subplot(2,5,7), subimage(or5);
	subplot(2,5,8), subimage(or33); 
	subplot(2,5,9), subimage(or55); 
endfunction

function sharpen()
	im = imread("image1.tif");
	sim = uint8(edge(im, 'sobel', 0.1))*255;
	simm = imsubtract(im, sim);
	per = uint8(edge(im, 'prewitt', 0.1))*255;
	pers = imsubtract(im, per);
	ed = uint8(edge(im, 'log'))*255;
	eds = imsubtract(im, ed);
	subplot(2,4,1), subimage(im); 
	subplot(2,4,2), subimage(sim); 
	subplot(2,4,3), subimage(simm); 
	subplot(2,4,4), subimage(per); 
	subplot(2,4,5), subimage(pers);
	subplot(2,4,6), subimage(ed); 
	subplot(2,4,7), subimage(eds); 
endfunction

function unsharp()
	im = imread("image1.tif");
	avgf = fspecial('average', [3 3]);
	avgfm = imfilter(im, avgf);
	subf = imsubtract(im, avgfm);
	subfm = imadd(im, subf);
	subplot(1,4,1), subimage(im); 
	subplot(1,4,2), subimage(avgfm); 
	subplot(1,4,3), subimage(subf); 
	subplot(1,4,4), subimage(subfm); 
endfunction
