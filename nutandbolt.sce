function arr =swap(arr,i,j)
    temp =arr(i);
    arr(i)=arr(j);
    arr(j)=temp;
endfunction

function arr= quickSort(arr,low,high,pivot)
    while low <high
        while arr(low)<pivot
            low=low+1;
    end
    while arr(high)>pivot
        high=high-1;
    end
    if low<=high 
        arr =swap(arr,low,high);
        low=low+1;
        high=high-1;
    end
end
if low<high
    arr = quickSort(arr,low,high,pivot);
end
endfunction
function matchNutsAndBolts(nuts,bolts)
    if length(nuts) ~= length(bolts)
        disp("Errror : number be same");
        return;
    end
    pivot = nuts(1);
    
    nuts = quickSort(nuts,1,length(nuts),pivot);
    bolts= quickSort(bolts ,1,length(bolts),pivot);
    disp("Match nuts and bolts");
    for i=1:length(nuts)
        disp("Nut: "+string(nuts(i)) +" bolt: "+string(bolts(i)));
       
    end
endfunction
nuts=[9,8,7,12];
bolts=[12,9,8,7];
matchNutsAndBolts(nuts,bolts);

