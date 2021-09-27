;;; build-site.el --- Build a website from org files -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Simon Attila Weis
;;
;; Author: Simon Attila Weis <https://github.com/siatwe>
;; Maintainer: Simon Attila Weis <me@siatwe.dev>
  ;; Created: September 27, 2021
;; Modified: September 27, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/siatwe/build-site
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Build a website from org files
;;
;;; Code:

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)

(require 'ox-publish)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(setq org-publish-project-alist
      (list
       (list "siatwe.dev"
             :recursive t
             :base-directory "~/Projects/siatwe.dev/content"
             :publishing-directory "~/Projects/siatwe.dev/public"
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creator t
             :with-toc t
             :section-numbers nil)))


(org-publish-all t)

(message "Build complete!")

(provide 'build-site)
;;; build-site.el ends here
