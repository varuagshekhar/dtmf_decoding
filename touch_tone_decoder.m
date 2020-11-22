clc
a = TouchToneSim(['5'],10); %Change here for single digit
output_for_single_digit = dtmf_decode(a);
display(output_for_single_digit)
multi= TouchToneSim(['1','2','3','4','5','6','7','8'],10);  % Change here for multiple digit transmission
nfft1=length(multi);

Fs=8000;
y=fftshift(fft(multi));
dF=Fs/nfft1;
f=-Fs/2 : dF : Fs/2-dF;
% figure;plot(f,abs(y));

% disp(length(y));
if(length(y)<4000)
          m=1;
end
 d=0;
 while(1)
     d=d+2000;
    if(length(y)>2000+d && length(y)<4000+d)
              m=((d)/2000)+1;
              break
    end
 end
      

 x=m;
 k=1;
 answ=[];
%  arr1=[];
 for u=1:1:x
     arr1=[];
     
     for index4=ceil(k):1:ceil(u*(length(multi)/x))
               arr1=[arr1,multi(index4)];
     end
     k=u*(length(multi)/x);
     
    nfft2=length(arr1);
    first=fftshift(fft(arr1));
    dF=Fs/nfft2;
    f2=-Fs/2 : dF : Fs/2-dF;
%     figure;plot(f2,abs(first));
     
     index1=1;
     index2=1;
     for i=1:1:length(first)

         if(abs(first(i))>400)
             index1=i;
    %          disp(index1)

             break
         end

     end

     freq1=f2(index1);
%       disp(freq1);
 
      
      for i=index1+1:1:length(first)
     
         if(f2(i)>0 && abs(first(i))>400)

             index2=i;
    %          disp(index2)
             break
         end
      end

     freq2=f2(index2);
     
  
%      disp(freq1);                 
%      disp(freq2);
      
    
    z=1;
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>690 && freq2<710)
          z='1';
 end
 
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>690 && freq2<710)
          z='2';
 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>690 && freq2<710)
          z='3';

 end
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>760 && freq2<780)
          z='4';

 end
     
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>760 && freq2<780)
          z='5';

 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>760 && freq2<780)
          z='6';

 end
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>842 && freq2<862)
          z='7';

 end
     
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>842 && freq2<862)
          z='8';

 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>842 && freq2<862)
          z='9';

 end
 
 if(abs(freq1)>1200 && abs(freq1)<1220 && freq2>931 && freq2<951)
          z='*';
          
 end
     
 if(abs(freq1)>1326 && abs(freq1)<1346 && freq2>931 && freq2<951)
          z='0';

 end
 
 if(abs(freq1)>1467 && abs(freq1)<1487 && freq2>931 && freq2<951)
          z='#';
 end
 
 answ=[answ,z];
    
 end
 fprintf('Output for multidigit transmission = ')
 disp(answ);


 


