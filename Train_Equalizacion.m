%%
%Preparacion del programa
clear all;clc;close all;
addpath('MRI_mat');
addpath('MRI_mat2');


%%
%Para el caso leve

examen=load('prueba_01.mat');

ch1=examen.vol.data(:,:,:,1);
ch2=examen.vol.data(:,:,:,2);
ch3=examen.vol.data(:,:,:,3);
ch4=examen.vol.data(:,:,:,4);

ch5=examen.vol.data(:,:,:,5);

tamanio=size(ch1);

%Equalizacion de los histogramas
for i=1:tamanio(3)
    
    capa_1=ch1(:,:,i);
    histeq(capa_1);
    ch1_nuevo(:,:,i)=capa_1;
    
    capa_2=ch2(:,:,i);
    histeq(capa_2);
    ch2_nuevo(:,:,i)=capa_2;
    
    capa_3=ch3(:,:,i);
    histeq(capa_3);
    ch3_nuevo(:,:,i)=capa_3;
    
    capa_4=ch4(:,:,i);
    histeq(capa_4);
    ch4_nuevo(:,:,i)=capa_4;
    
end

%Visualizacion de los canales
for i=1:tamanio(3)

    subplot(2,2,1);colormap('gray');imagesc(ch1_nuevo(:,:,i));
    subplot(2,2,2);colormap('gray');imagesc(ch2_nuevo(:,:,i));
    subplot(2,2,3);colormap('gray');imagesc(ch3_nuevo(:,:,i));
    subplot(2,2,4);colormap('gray');imagesc(ch4_nuevo(:,:,i));
    drawnow;
    hold on;
    
end
close all;
%Entrenamiento del S.V.M

[CH,CA,anotaciones]=vol_Reshape_5CH(ch1_nuevo,ch2_nuevo,ch2_nuevo,ch2_nuevo,ch5,tamanio(1)*tamanio(2)*tamanio(3));


modelo=svmtrain(CH,CA,'kernel_function','rbf');

