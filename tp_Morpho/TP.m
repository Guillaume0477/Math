clear all; close all;

%%
%%%%%%%%%%%%%%%%%%%%%%Gradient Morphologique%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W=2; %Largeur de l'element structurant de dilatation et d'erosion
SE=strel('diamond',W); %Element structurant de dilatation et d'erosion

W_o=10; %Largeur de l'element structurant d'ouverture
SE_open=strel('square',W_o);%Element structurant d'ouverture

Im = imread('Ampoule.gif'); %Importation de l'image
Im_dilate=imdilate(Im,SE); %Image dilatee
Im_erode=imerode(Im,SE); %Image erodee
Im_grad=Im_dilate-Im_erode; %Gradient morphologique de l'image

Im_open=imopen(Im,SE_open); %Image originale apres ouverture
Im_dilate_open=imdilate(Im_open,SE); %Image bothat dilatee
Im_erode_open=imerode(Im_open,SE); %Image bothat erodee
Im_grad_open=Im_dilate_open-Im_erode_open; %Gradient morphologique de l'image bothat


%Affichage
figure(1)
subplot(221)
imshow(Im,[])
title 'Image originale'
subplot(222)
imshow(Im_grad,[])
title 'Gradient morphologique de l image'
subplot(223)
imshow(Im_open,[])
title 'Image originale apres ouverture'
subplot(224)
imshow(Im_grad_open,[])
title 'Gradient morphologique de l image apres ouverture'

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TOP HAT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W=3; %Largeur de l'element structurant
SE=strel('square',W); %Element structurant

Im = imread('angiogram.png'); %Importation de l'image
Im_tophat=imtophat(Im,SE); %Image apres operation tophat
Im_bothat=imbothat(Im,SE); %Image apres operation bothat

%Affichage
figure(2)
subplot(121)
imshow(Im)
title 'Image originale'
subplot(122)
imshow(Im_tophat)
title 'Image apres operation tophat'

%%
%%%%%%%%%%%%%%%%%%%%%%%%%Ouverture par reconstruction%%%%%%%%%%%%%%%%%%%%%%
size=[25,1];Im_grad=Im_grad-min(Im_grad(:)); %Taille de l'element structurant de l'erosion
SE_mask=strel('rectangle',size); %Element structurant

W=5; %Largeur de l'element structurant de la dilatation
SE_dil=strel('square',W); %Element structurant de la dilatation

Im = imread('Recit_b.png'); %Importation de l'image
Im_mask=imerode(Im,SE_mask); %Erosion de l'image

Im_mask_origine=Im_mask; %Recuperation du masque d'origine

%Reconstruction par dilatation
while(1)
    Im_mask_old=Im_mask; %Garde en memoire le masque precedent
    Im_dilate=imdilate(Im_mask,SE_dil); %Dilate le masque
    Im_mask=min(Im,Im_dilate); %compare le nouveau masque à l'image d'origine
    if (Im_mask_old==Im_mask) %Si le nouveau masque est le meme que l'ancien
        break %Fin de la reconstruction
    end
end

%Affichage
figure(3)
subplot(221)
imshow(Im)
title 'Image originale'
subplot(222)
imshow(Im_mask_origine)
title 'Masque'
subplot(223);
imshow(Im_mask)
title 'reconstruction'
