% %%
f=instrfind;
delete(f);
clc;
clear all;
close all;
imaqreset;
s = serial('COM14' , 'Baud',9600);

vid = imaq.VideoDevice('winvideo', 1, 'MJPG_640x480');
vid.ReturnedColorSpace='rgb';
 figure('name','Preview','menubar','none','numbertitle','off','tag','t');
 fo=vision.CascadeObjectDetector;
 while true
       FaceDetect=vision.CascadeObjectDetector('FrontalFaceLBP');
    I=step(vid);
    imshow(I);
    BB=step(FaceDetect,I);
    if(numel(BB)==0)
        continue;
    end;
    [m n]=size(BB);
    for o=1:m
       Face=imcrop(I,BB(o,:));
    EyeDetect=vision.CascadeObjectDetector('EyePairSmall');
    BB2=step(EyeDetect,Face);
    b=size(BB2);
    if(numel(BB2)==0)
        disp('Not detected');
        
        continue;
    else
        disp('Detected');
        fopen(s);
        disp(a);
        fclose(s);
        
    end;
    end
    [m1 n1]=size(BB);
    for o1=1:m1
       Face=imcrop(I,BB(o1,:));
    Eyes=imcrop(Face,BB2);
    imshow(Eyes);
    end
  
       pause(0.01); 
 f=findobj('tag','t');
    if isempty(f)
        close(gcf)
        break;
    end
    
 end
      
% % %%