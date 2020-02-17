function M = filledJulia(iterations,left,right,bottom,top,xRes,yRes,c)

    colormap([1 0 0; 1 1 1]);


    M = 2*ones(yRes,xRes);

    oldCompletion = 0;
    lineLength = displayCompletion(oldCompletion, 0);
    for j=1:yRes,
        y = bottom + (j-1)*(top - bottom)/yRes;
        for i=1:xRes,
            x = left + (i-1)*(right - left)/xRes;
            zk = c;
            c = x + 1i*y;
            kount = 0;

            while kount < iterations && abs(zk) < sqrt((top - bottom)^2 + (right - left)^2),
                kount = kount + 1;
                zk = zk^2 + c;
            end;
            if kount >= iterations,
                M(j,i) = 1;
            end;
            completion = round(((j-1)/yRes+i/(xRes*yRes))*100);
            if (completion ~= oldCompletion),
                lineLength = displayCompletion(completion, lineLength);
                oldCompletion = completion;
            end;
        end;
    end;
    fprintf("\nDone\n");
end
