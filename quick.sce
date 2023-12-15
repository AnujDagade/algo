function arr = quickSort(arr, low, high)
    if low < high
        pi = partition(arr, low, high);
        arr = quickSort(arr, low, pi - 1);
        arr = quickSort(arr, pi + 1, high);
    end
endfunction

function pivot = partition(arr, low, high)
    pivot = arr(high);
    i = low - 1;
    for j = low:high-1
        if arr(j) <= pivot
            i = i + 1;
            [arr(i), arr(j)] = swap(arr(i), arr(j));
        end
    end
    [arr(i+1), arr(high)] = swap(arr(i+1), arr(high));
    pivot = i + 1;
endfunction

function [a, b] = swap(a, b)
    temp = a;
    a = b;
    b = temp;
endfunction

// Main code
n = input("Enter the number of elements in the array: ");
arr = rand(1, n, "integer") * 100; // Generating random array of integers

disp("Original Array:");
disp(arr);

arr = quickSort(arr, 1, n);

disp("Sorted Array:");
disp(arr);
