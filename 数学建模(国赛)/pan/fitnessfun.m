function point=fitnessfun(l,w,q)
 S=w*l-(4-pi)*w^2*q^2/4;
if (w<=80||w>=10||l>=10||l<=80||q>=0||q<=1||l>=w)
    point=0;
else
    biaozhuncha=lwq(l,w,q);
    pointb=(biaozhuncha-0.001107086)/(35.30651715-0.001107086);
    pointn=S/(w*l);
    point=-1*(p*pointb+(1-p)*pointn);
end
end

