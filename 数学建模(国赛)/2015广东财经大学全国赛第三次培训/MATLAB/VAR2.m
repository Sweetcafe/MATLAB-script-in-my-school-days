hold on
contour(pp)
colormap gray
V=[]
for i=35:length(I4)-34
    for j=35:length(I4)-34
       L=I4(i-34:i+34,j-34:j+34);
        if std2(L)<=3
            V(end+1,1)=i;
            V(end,2)=j;
            hold on
            plot(i,j,'or','MarkerFaceColor','r')
           
        end
    end
    

end
%xlswrite('V',V)
