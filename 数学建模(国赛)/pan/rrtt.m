function [pann] = rrtt(l,w,q,tp,ta)
r=w*q/2;
d=4;
dw=d*w;
dl=d*l;
dr=d*r;
pann=tp*ones(dw,dl);
for i=1:dw
    for j=1:dl
        D=[];
        if i<=dr&&j<=dr
           D=sqrt((i-dr-1)^2+(j-dr-1)^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
        if i<=dr&&j>=dl-dr
           D=sqrt((i-dr-1)^2+(j-(dl-dr))^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
        if i>=dw-dr&&j<=dr
           D=sqrt((i-(dw-dr))^2+(j-dr-1)^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
        if i>=dw-dr&&j>=dl-dr
           D=sqrt((i-(dw-dr))^2+(j-(dl-dr))^2);
           if D>=dr
              pann(i,j)=ta;
           end
        end
    end
end
end

