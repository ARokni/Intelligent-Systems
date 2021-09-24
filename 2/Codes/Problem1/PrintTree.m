function [] = PrintTree(tree, parent)
% Prints the tree structure (preorder traversal)

% Print current node
if (strcmp(tree.value, 'true'));
    fprintf('parent: %s\ttrue\n', parent);
    return
elseif (strcmp(tree.value, 'false'));
    fprintf('parent: %s\tfalse\n', parent);
    return
else
    % Current node an attribute splitter
    fprintf('parent: %s\tattribute: %s\t0Child:%s\t1Child:%s\t2Child:%s\t3Child:%s\t4Child:%s\t5Child:%s\t6Child:%s\t7Child:%s\t8Child:%s\t9Child:%s\t10Child:%s\t11Child:%s\t12Child:%s\t13Child:%s\t14Child:%s\t15Child:%s\n',parent, tree.value, tree.r0.value, tree.r1.value, tree.r2.value, tree.r3.value, tree.r4.value,tree.r5.value, tree.r6.value, tree.r7.value, tree.r8.value, tree.r9.value, tree.r10.value,  tree.r11.value, tree.r12.value, tree.r13.value, tree.r14.value, tree.r15.value);
end

% Recur the r0 subtree
PrintTree(tree.r0, tree.value);
% Recur the r1 subtree
PrintTree(tree.r1, tree.value);
% Recur the r2 subtree
PrintTree(tree.r2, tree.value);
% Recur the r3 subtree
PrintTree(tree.r3, tree.value);
% Recur the r4 subtree
PrintTree(tree.r4, tree.value);
% Recur the r5 subtree
PrintTree(tree.r5, tree.value);
% Recur the r6 subtree
PrintTree(tree.r6, tree.value);
% Recur the r7 subtree
PrintTree(tree.r7, tree.value);
% Recur the r8 subtree
PrintTree(tree.r8, tree.value);
% Recur the r9 subtree
PrintTree(tree.r9, tree.value);
% Recur the r10 subtree
PrintTree(tree.r10, tree.value);
% Recur the r11 subtree
PrintTree(tree.r11, tree.value);
% Recur the r12 subtree
PrintTree(tree.r12, tree.value);
% Recur the r13 subtree
PrintTree(tree.r13, tree.value);
% Recur the r14 subtree
PrintTree(tree.r14, tree.value);
% Recur the r15 subtree
PrintTree(tree.r15, tree.value);



end