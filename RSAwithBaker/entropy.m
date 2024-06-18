% Read the original image
I = imread('C:\Users\virus\Desktop\images\airplane.png');
Hi=imhist((I));
[x y z]=size(I);
L=x*y*z ;
co=1;
for i=1:256
    if Hi(i)>0
        P(co)=(Hi(i))/L;
        co=co+1;
    end 
end
ENT=-(P.*log2(P));
EN=sum(ENT)
EN_orig= 7.7502;
EN_enc=7.962;
figure;
bar([EN_orig, EN_enc], 'BarWidth', 0.5);
colormap([0 0 1; 1 0 0]); % blue and red
xlabel('Image');
ylabel('Entropy');
xticklabels({'Original', 'Encrypted'});
title('Entropy of Original and Encrypted Images');