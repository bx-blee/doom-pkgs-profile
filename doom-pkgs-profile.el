;;; doom-pkgs-profile.el --- Doom Packages Profile From Outside Of Doom  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Summary: Library to process Doom packages profile.
" orgCmntEnd)

;;;#+BEGIN: b:elisp:file/copyLeftPlus :outLevel 1
(orgCmntBegin "
* Libre-Halaal Software --- Part Of Blee ---  Poly-COMEEGA Format.
** This is Libre-Halaal Software. © Libre-Halaal Foundation. Subject to AGPL.
** It is not part of Emacs. It is part of Blee.
** Best read and edited  with Poly-COMEEGA (Polymode Colaborative Org-Mode Enhance Emacs Generalized Authorship)
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: b:elisp:file/authors :authors ("./inserts/authors-mb.org")
(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: b:elisp:file/orgTopControls :outLevel 1
(orgCmntBegin "
*  ~ORG-TOP-CONTROLS-COME-HERE~
" orgCmntEnd)
;;;#+END:

(orgCmntBegin "
* Relevant Panels:
** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
* Planned Improvements:
*

" orgCmntEnd)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "REQUIRES" :extraInfo "Imports"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _REQUIRES_: |]]  Imports  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;(require 'blee-libs)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 1 :title "Variables And Constants" :extraInfo "defvar, defcustom"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_       [[elisp:(outline-show-subtree+toggle)][| *Variables And Constants:* |]]  defvar, defcustom  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(defvar b:profiles:doom:3.0.0.alpha nil
   " #+begin_org
** =b:profiles:doom:3.0.0.alpha= list of doom version 3.0.0.alpha packages and their versions.
#+end_org "
  )

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Blee Package Information" :extraInfo "Canonical"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Blee Package Information_: |]]  Canonical  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile|prepare"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile|prepare>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile|prepare (
;;;#+END:
                              <pkgsProfileName)
   " #+begin_org
** DocStr: For now, we only support doom:3.0.0.alpha. *<pkgsProfileName* ignored for now.
Each pkgs information is stored as a symbol property of b:profiles:doom:3.0.0.alpha.
#+end_org "
   (let* (
          ($pkgsListIntake)
         )
     (setq $pkgsListIntake (b:read|fromFile "/bisos/blee/profiles/doom/doom-3.0.0-alpha.el"))
     ;;
     ;; Next we setup b:profiles:doom:3.0.0.alpha
     ;;
     (b:remprop-all 'b:profiles:doom:3.0.0.alpha)
     (dolist ($each $pkgsListIntake)
       ;;(print (car $each))
       (put 'b:profiles:doom:3.0.0.alpha (car $each) (cdr $each)))
     ;;(symbol-plist 'b:profiles:doom:3.0.0.alpha)
     ))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile|prepare 'doom:3.0.0.alpha)
#+END_SRC

#+RESULTS:

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:pkg|obtainInfo"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:pkg|obtainInfo>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:pkg|obtainInfo (
;;;#+END:
                                     <pkgsProfileName <pkgName)
   " #+begin_org
** DocStr: **<pkgsProfileName** ignored for now. Return keyword list for *<pkgName*
#+end_org "
   (let* (
          ($result)
         )
     (setq $result
           (get 'b:profiles:doom:3.0.0.alpha <pkgName))
     ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg|obtainInfo 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:
| :repoUrl | https://github.com/codesuki/add-node-modules-path.git | :commit | 5cbdbf0d2015540c59ed8ee0fcf4788effdf75b6 |

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:pkg:straight|install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:pkg:straight|install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:pkg:straight|install (
;;;#+END:
                                           <pkgsProfileName <pkgName)
   " #+begin_org
** DocStr: *<pkgsProfileName* ignored for now. *<pkgName* is installed through straight.
#+end_org "
  (let* (
          ($pkgInfo (b:pkgsProfile:pkg|obtainInfo <pkgsProfileName <pkgName))
          ($repoUrl (or (plist-get $pkgInfo :repoUrl) "UnSpecified"))
          ($commit (or (plist-get $pkgInfo :commit) "UnSpecified"))
         )
    $commit
     ))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: 5cbdbf0d2015540c59ed8ee0fcf4788effdf75b6

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|profiledInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|profiledInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|profiledInstall (
;;;#+END:
                                       <pkgName)
   " #+begin_org
** DocStr: Using the default pkgsProfileName, install *<pkgName* with straight.
#+end_org "
   (b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha <pkgName)
   )


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|profiledInstall 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: 5cbdbf0d2015540c59ed8ee0fcf4788effdf75b6

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|latestInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|latestInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|latestInstall (
;;;#+END:
                                     <pkgName)
   " #+begin_org
** DocStr: Using the default pkgsProfileName, install *<pkgName* with straight.
#+end_org "
   (message "NOTYET")
   )


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|latestInstall 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: NOTYET

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|forDevInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|forDevInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|forDevInstall (
;;;#+END:
                                     <pkgName)
   " #+begin_org
** DocStr: Using the default pkgsProfileName, install *<pkgName* with straight.
#+end_org "
   (message "NOTYET")
   )


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|forDevInstall 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: NOTYET

" orgCmntEnd)


;;;#+BEGIN: b:elisp:file/provide :modName nil
(provide 'doom-pkgs-profile)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
