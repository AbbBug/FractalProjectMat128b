function M = filledJulia2(iterations,left,right,bottom,top,xRes,yRes,c)

    fixpt1 = (1 + sqrt(6))/2;
    fixpt2 = (1 - sqrt(6))/2;
    colormap([1 0 0; 1 1 1]);



    M = 2*ones(yRes,xRes);

    oldCompletion = 0;
    lineLength = displayCompletion(oldCompletion, 0);
    for j=1:yRes,
        y = bottom + (j-1)*(top - bottom)/yRes;
        for i=1:xRes,
            x = left + (i-1)*(right - left)/xRes;
            z = x + 1i*y;
            zk = z;
            iflag1 = 0;
            iflag2 = 0;
            kount = 0;

            while kount < iterations && abs(zk) < sqrt((top - bottom)^2 + (right - left)^2) && iflag1 < 5 && iflag2 < 5,
                kount = kount + 1;
                zk = zk^2 + c;

                err1 = abs(zk-fixpt1);
                if (err1 < 1.e-6),
                    iflag1 = iflag1 + 1;
                else,
                    iflag1 = 0;
                end;

                err2 = abs(zk-fixpt2);
                if err2 < 1.e-6,
                    iflag2 = iflag2 + 1;
                else,
                    iflag2 = 0;
                end;

            end;
            if iflag1 >= 5 || iflag2 >= 5 || kount >= iterations,
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
