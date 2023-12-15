function solve_nqueens(N)
    board = zeros(N, N);
    if solve_nqueens_util(board, 1, N) == false
        disp('Solution does not exist.');
    end
end

function result = solve_nqueens_util(board, col, N)
    if col > N
        print_solution(board);
        result = true;
        return;
    end

    result = false;
    for i = 1:N
        if is_safe(board, i, col, N)
            board(i, col) = 1;

            if solve_nqueens_util(board, col + 1, N) == true
                result = true;
            end

            board(i, col) = 0;  // Backtrack
        end
    end
end

function safe = is_safe(board, row, col, N)
    % Check if there's a queen in the same row
    for i = 1:col-1
        if board(row, i) == 1
            safe = false;
            return;
        end
    end

    % Check upper diagonal on left side
    for i = row, j = col
        while i > 1 && j > 1
            i = i - 1;
            j = j - 1;
            if board(i, j) == 1
                safe = false;
                return;
            end
        end
    end

    % Check lower diagonal on left side
    for i = row, j = col
        while i < N && j > 1
            i = i + 1;
            j = j - 1;
            if board(i, j) == 1
                safe = false;
                return;
            end
        end
    end

    safe = true;
end

function print_solution(board)
    disp('Solution:');
    disp(board);
    disp('--------------');
end


N = 4;  % Change N to desired size
solve_nqueens(N)
