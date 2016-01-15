function canal=vol_Reshape_1CH(ch,num)
numpixels=num;

C1=permute(ch,[1,2,3]);
C1=reshape(C1,numpixels,1,1);

canal = C1;

end