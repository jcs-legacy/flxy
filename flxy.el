;;; flxy.el --- Fast, character-based search library in Rust  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-10-17 22:30:47

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Fast, character-based search library in Rust
;; Keyword: fuzzy search lisp
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/jcs-elpa/flxy

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Fast, character-based search library in Rust
;;
;; Inspired by flx for emacs, uses the same basic algorithm.
;;

;;; Code:

(require 'cl-lib)
(require 'subr-x)

(defconst flxy--bin-dir
  (concat (file-name-directory load-file-name) "bin/")
  "Pre-built binaries directory path.")

(defconst flxy--dyn-name "flxy"
  "Dynamic module name.")

;;
;; (@* "Externals" )
;;

(declare-function flxy-score "flxy-core")

;;
;; (@* "Bootstrap" )
;;

;;;###autoload
(defun flxy-load-dyn ()
  "Load dynamic module."
  (interactive)
  (unless (featurep 'flxy-core)
    (let* ((dyn-name (cl-case system-type
                       ((windows-nt ms-dos cygwin) (concat fuz-bin--dyn-name ".dll"))
                       (darwin (concat "lib" fuz-bin--dyn-name ".dylib"))
                       (t (concat "lib" fuz-bin--dyn-name ".so"))))
           (dyn-path (concat fuz-bin--bin-dir dyn-name)))
      (module-load dyn-path)
      (message "[INFO] Successfully load dynamic module, `%s`" dyn-name))))

(provide 'flxy)
;;; flxy.el ends here
