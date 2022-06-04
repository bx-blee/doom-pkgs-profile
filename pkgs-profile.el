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


;;; OBSOLETED
(defvar b:pkgsProfile:doom:3.0.0.alpha nil
   " #+begin_org
** =b:pkgsProfile:doom:3.0.0.alpha= list of doom version 3.0.0.alpha packages and their versions.
#+end_org "
  )

(defvar b:pkgsProfile:blee3:doom3 "/bisos/blee/profiles/blee3/doom3-pkgsProfile.el"
   " #+begin_org
** =b:pkgsProfile:blee3:doom3= list of doom version 3.0.0.alpha packages and their versions.
#+end_org "
  )
(put 'b:pkgsProfile:blee3:doom3 ':profileName "blee3-doom3")

(defvar b:pkgsProfile:blee3:native "/bisos/blee/profiles/blee3/native-pkgsProfile.el"
   " #+begin_org
** =b:pkgsProfile:blee3:native= list of packages and their versions as property-list.
#+end_org "
  )
(put 'b:pkgsProfile:blee3:native ':profileName "blee3-native")

(defvar b:pkgsProfile:blee3:adopted "/bisos/blee/profiles/blee3/adopted-pkgsProfile.el"
   " #+begin_org
** =b:pkgsProfile:blee3:adopted= list of packages and their versions.
#+end_org "
  )
(put 'b:pkgsProfile:blee3:adopted ':profileName "blee3-adopted")

(defvar b:pkgsProfile:blee3:realm-site "/bisos/blee/profiles/blee3/realm-site-pkgsProfile.el"
   " #+begin_org
** =b:pkgsProfile:blee3:adopted= list of packages and their versions.
#+end_org "
  )
(put 'b:pkgsProfile:blee3:realm-site ':profileName "blee3-realm-site")

(defvar b:pkgsProfile:blee3:realm-user "/bisos/blee/profiles/blee3/realm-user-pkgsProfile.el"
   " #+begin_org
** =b:pkgsProfile:blee3:adopted= list of packages and their versions.
#+end_org "
  )
(put 'b:pkgsProfile:blee3:realm-site ':profileName "blee3-realm-user")


(defvar b:pkgsProfile:blee3:all
  `(
    b:pkgsProfile:blee3:doom3
    b:pkgsProfile:blee3:native
    b:pkgsProfile:blee3:adopted
    )
   " #+begin_org
** =b:pkgsProfile:blee3:all= list of packages and their versions.
#+end_org "
  )

(defvar b:pkgsProfile:blee3:allSansDoom3
  `(
    b:pkgsProfile:blee3:native
    b:pkgsProfile:blee3:adopted
    )
   " #+begin_org
** =b:pkgsProfile:blee3:all= list of packages and their versions.
#+end_org "
  )


;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Blee Package Information" :extraInfo "Canonical -- OBSOLETED"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Blee Package Information_: |]]  Canonical -- OBSOLETED  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:doom3|prepare"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:doom3|prepare>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:doom3|prepare (
;;;#+END:
                                    <pkgsProfileName)
   " #+begin_org
** DocStr: For now, we only support doom:3.0.0.alpha. *<pkgsProfileName* ignored for now.
Each pkgs information is stored as a symbol property of b:pkgsProfile:doom:3.0.0.alpha.
#+end_org "
   (let* (
          ($pkgsListIntake)
         )
     (setq $pkgsListIntake (b:read|fromFile "/bisos/blee/profiles/doom/doom-3.0.0-alpha.el"))
     ;;
     ;; Next we setup b:pkgsProfile:doom:3.0.0.alpha
     ;;
     (b:remprop-all 'b:pkgsProfile:doom:3.0.0.alpha)
     (dolist ($each $pkgsListIntake)
       ;;(print (car $each))
       (put 'b:pkgsProfile:doom:3.0.0.alpha (car $each) (cdr $each)))
     ;;(symbol-plist 'b:pkgsProfile:doom:3.0.0.alpha)
     ))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:doom3|prepare 'b:pkgsProfile:blee3:doom3)
#+END_SRC

#+RESULTS:

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:blee3:read|prepare"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:blee3:read|prepare>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:blee3:read|prepare (
;;;#+END:
                                         <pkgsProfileSymbol)
   " #+begin_org
** DocStr:
Each pkgs information is stored as a symbol property of b:pkgsProfile:doom:3.0.0.alpha.
#+end_org "
   (let* (
          ($pkgsProfile (eval <pkgsProfileSymbol))
          ($pkgsListIntake)
         )
     (message (format "Preparing %s :: Reading %s"
                      (get <pkgsProfileSymbol ':profileName)  $pkgsProfile))

     (setq $pkgsListIntake (b:read|fromFile $pkgsProfile))
     (put <pkgsProfileSymbol ':pkgsList $pkgsListIntake)))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:blee3:read|prepare 'b:pkgsProfile:blee3:doom3)
#+END_SRC

#+RESULTS:

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:pkg|obtainInfo"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:pkg|obtainInfo>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:pkg|obtainInfo (
;;;#+END:
                                     <pkgsProfileSymbol <pkgName)
   " #+begin_org
** DocStr: Given **<pkgsProfileSymbol* return info (commitHash) for *<pkgName*.
*<pkgName* is a string.
#+end_org "
   (let* (
          ($pkgsList (get <pkgsProfileSymbol ':pkgsList))
          ($pkgInfo (assoc <pkgName $pkgsList))
         )
     (cdr $pkgInfo)
     ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg|obtainInfo 'b:pkgsProfile:blee3:doom3 \"add-node-modules-path\")
#+END_SRC

#+RESULTS:
: 7d9be65b3be062842b7ead862dec15d6f25db4a2

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:pkg:blee3|obtainInfo"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:pkg:blee3|obtainInfo>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:pkg:blee3|obtainInfo (
;;;#+END:
                                           <pkgsProfileName <pkgName)
   " #+begin_org
** DocStr: **<pkgsProfileName** ignored for now. Return keyword list for *<pkgName*
#+end_org "
   (b:pkgsProfile:pkg|obtainInfo 'b:pkgsProfile:blee3:all <pkgName))

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
                                           <pkgsProfileSymbol <pkgName &optional <ref)
   " #+begin_org
** DocStr: *<pkgsProfileName* ignored for now. *<pkgName* is installed through straight.
#+end_org "
  (let* (
         ($profilePkgRef (b:pkgsProfile:pkg|obtainInfo <pkgsProfileName <pkgName))
         )
    (message "straight-use-package with profileName, pkgName and commitHash comes here.")
     ))


(orgCmntBegin "
(use-package some-package-with-bug-in-recent-commits
  :straight (:host github
             :repo \"package/repo\"
             :ref \"hashofthepackagewherethebugdidn'toccurr\"))

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



;;;#+BEGIN:  b:elisp:defs/defun :defName "b:doom:pkgs:pinned|writeList"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:doom:pkgs:pinned|writeList>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:doom:pkgs:pinned|writeList (
;;;#+END:
                                     <fileName)
   " #+begin_org
** DocStr: Actions based on =parameters= and *returnValues*
and side-effects are documented here
#+end_org "
   (with-temp-file
     <fileName
     (progn
       (insert ";; Auto generated, do not hand edit.\n")
       (insert "'(\n")
       (dolist ($each (doom-package-pinned-list))
         (insert (format "  %s\n" $each)))
       (insert ")\n"))))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:doom:pkgs:pinned|writeList b:pkgsProfile:blee3:doom3)
#+END_SRC

#+RESULTS:

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:blee3+:straight--lockfile-read-all|advice"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:blee3+:straight--lockfile-read-all|advice>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:blee3+:straight--lockfile-read-all|advice (
;;;#+END:
                                                                <origFunc &rest <args)
   " #+begin_org
** DocStr: This is a special purpose around advice-add for straight--lockfile-read-all.
A combined pinned-list of packages is added to the original list.
The original straight--lockfile-read-all comes first.
#+end_org "
   (append (apply <origFunc <args) ; lockfiles still take priority
           (b:pkgsProfile:blee3|pinnedListAll)))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:blee3+:straight--lockfile-read-all|advice 'straight--lockfile-read-all)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/advice-add :symbol "straight--lockfile-read-all" :where "around" :function "b:pkgsProfile:blee3+:straight--lockfile-read-all|advice"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =advice-add=  symbol=straight--lockfile-read-all where=around function=[[b:pkgsProfile:blee3+:straight--lockfile-read-all|advice]] [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(advice-add 'straight--lockfile-read-all :around #'b:pkgsProfile:blee3+:straight--lockfile-read-all|advice)
;;;#+END:

;;; (straight--lockfile-read-all)

;;; (straight-use-package 'emms) (straight-use-package 'pyvenv) (straight-use-package 'avy) (straight-use-package 'tide)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:blee3|pinnedListAll"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:blee3|pinnedListAll>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:blee3|pinnedListAll (
;;;#+END:
                                          )
   " #+begin_org
** DocStr: Based on contents of /bisos/blee/profile/blee3 read all relevant files and convert to list.
#+end_org "
   (let* (
          ($pkgsListIntake)
          ($result ())
         )
     ;;(dolist ($eachFile b:pkgsProfile:blee3:allSansDoom3)
     (dolist ($profileSymb b:pkgsProfile:blee3:all)
       (message (format "Preparation Of :: %s" $profileSymb))
       (b:pkgsProfile:blee3:read|prepare $profileSymb)
       (setq $result (append $result (get $profileSymb ':pkgsList)))
       )
     $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
;; (get 'b:pkgsProfile:blee3:doom3 ':pkgsList)
(b:pkgsProfile:blee3|pinnedListAll)
#+END_SRC
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
