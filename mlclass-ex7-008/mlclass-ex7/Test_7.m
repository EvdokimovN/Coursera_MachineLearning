X = [0 1; 5 5; -1 8] 
cent = computeCentroids([0 1; 5 5; -1 8], [2 1 2]', 2)

idx = [2 1 2]'
X_rec = cent(idx,:)


projectData(sin([0 1 2; 3 4 5; 6 7 8]), magic(3), 2)
recoverData([1 2; 3 4], magic(3), 2)