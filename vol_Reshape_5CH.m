function [CH,CA,anotaciones]= vol_Reshape_5CH(c1,c2,c3,c4,a,num)

numpixels=num;

C1=permute(c1,[1,2,3]);
C1=reshape(C1,numpixels,1,1);

C2=permute(c2,[1,2,3]);
C2=reshape(C2,numpixels,1,1);

C3=permute(c3,[1,2,3]);
C3=reshape(C3,numpixels,1,1);

C4=permute(c4,[1,2,3]);
C4=reshape(C4,numpixels,1,1);

CA=permute(a,[1,2,3]);
CA=reshape(CA,numpixels,1,1);

CA=double(CA);

anotaciones=CA;


CH=horzcat(C1,C2,C3,C4);


end