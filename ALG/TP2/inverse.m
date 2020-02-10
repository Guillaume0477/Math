function M_inv=inverse(M)
    taille = length(M);
    
    if taille >=2
        A=M(1:(taille-1),1:(taille-1));
        VT=M(taille,1:taille-1);
        U=M(1:(taille-1),taille);
        alpha=M(taille,taille);
        
        A1=inverse (A);
        P=A1*(eye(taille-1)-U*(VT)*A1/(VT*A1*U-alpha));
        Q=A1*U/(VT*A1*U-alpha);
        s=alpha-VT*A1*U;
        WT=VT*A1/(VT*A1*U-alpha);
        
        M_inv=[P,Q;WT,1/s]
            
    else
        M_inv=1/M;
    end    
end
        
        