; 数学运算
(* 2 3)

; 连接字符串
(concat "a" "c")

; 定义函数
(defun func (arg1 arg2)
  "Here is your document"
  (concat arg1 arg2))
(func "Linux" "GNU")

; List 
(car '(a b c))

;; Build list
(list)

(list 1 2 3 4 5)

(make-list 3 'pigs)

(setq l (make-list 3 '(a b)))

(eq (car l) (cadr l))

(setq trees '(pine oak))

(setq more-trees (append '(maple birch) trees))

trees
more-trees

(eq trees (cdr (cdr more-trees)))
