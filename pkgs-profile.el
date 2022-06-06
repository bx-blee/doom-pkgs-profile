;;; pkgs-profile.el --- Packages Profile  -*- lexical-binding: t; -*-

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

(defvar pkg:straight:explicit:info
  '()
   " #+begin_org
** =b:pkgsProfile:frmWrk:example= list of  packages and their versions.
#+end_org "
  )


(defvar b:pkgsProfile:frmWrk:example "./profiles/frmWrkExample-pkgsProfile.el"
   " #+begin_org
** =b:pkgsProfile:frmWrk:example= list of  packages and their versions.
#+end_org "
  )
(put 'b:pkgsProfile:frmWrk:example ':profileName "frmWrk:example")

(defvar b:pkgsProfile:frmWrkExample:all
  `(
    b:pkgsProfile:frmWrk:example
    )
   " #+begin_org
** =b:pkgsProfile:frmWrkExample:all= list of packages and their versions.
#+end_org "
  )

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "Blee Package Information" :extraInfo "Canonical -- OBSOLETED"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _Blee Package Information_: |]]  Canonical -- OBSOLETED  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:file:read|prepare"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:file:read|prepare>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:file:read|prepare (
;;;#+END:
                                         <pkgsProfileSymbol)
   " #+begin_org
** DocStr: Read from *<pkgsProfileSymbol* file and capture that as ~:pkgsList~ property list.
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
(b:pkgsProfile:file:read|prepare 'b:pkgsProfile:frmWrk:example)
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
** DocStr: Given *<pkgsProfileSymbol* return info (commitHash) for *<pkgName*.
Type of *<pkgName* is a string.
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
(b:pkgsProfile:pkg|obtainInfo 'b:pkgsProfile:frmWrk:example \"add-node-modules-path\")
#+END_SRC

#+RESULTS:
: 7d9be65b3be062842b7ead862dec15d6f25db4a2

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|install (
;;;#+END:
                                           <pkgsProfileSymbol <pkgName &optional <ref)
   " #+begin_org
** TODO DocStr: First try anyProfileInstall, if that fails, try recordInstall.
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

** TODO Basic Usage: INCOMPLETE
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: 5cbdbf0d2015540c59ed8ee0fcf4788effdf75b6

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|recordInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|recordInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|recordInstall (
;;;#+END:
                                           <pkgsProfileSymbol <pkgName &optional <ref)
   " #+begin_org
** TODO DocStr: INCOMPLETE. Install an record.
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

** TODO Basic Usage: INCOMPLETE
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: 5cbdbf0d2015540c59ed8ee0fcf4788effdf75b6

" orgCmntEnd)



;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:pkg:straight:explicit|install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =cl-defun= <<b:pkg:straight:explicit|install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(cl-defun b:pkg:straight:explicit|install (
;;;#+END:
                                          <pkgName
                                          &key
                                          (ref nil)
                                          (pkgsProfileSymbol nil)
                                          )
   " #+begin_org
** DocStr: Explicitly install a package with straight, but this does not apply to its dependencies.
Things can become complicated with named-pkgs-profile.
#+end_org "
   (let* (
          (<ref ref)
          (<pkgsProfileSymbol pkgsProfileSymbol)
          ($origCurProfile straight-current-profile)
          ($result)
          )
     (unless <ref (error "<ref if mandatory") (cl-return nil)) ;;; Mandatory kw-arg

     (setq pkg:straight:explicit:info '())
     (push '(<pkgName . <ref) pkg:straight:explicit:info)

     (advice-remove 'straight--lockfile-read-all :around #'b:straight--lockfile-read-all|advice)
     (advice-add 'straight--lockfile-read-all :around #'b:straight--lockfile-read-all|advice)

     (when <pkgsProfileSymbol
       (setq straight-current-profile <pkgsProfileSymbol))

     ;; Install the package if needed
     (setq $result (straight-use-pkg <pkgName))

     ;; Restore things back to normal
     (advice-remove 'straight--lockfile-read-all :around #'b:straight--lockfile-read-all|advice)
     (setq straight-current-profile $origCurProfile)
     $result))



(orgCmntBegin "
(use-package some-package-with-bug-in-recent-commits
  :straight (:host github
             :repo \"package/repo\"
             :ref \"hashofthepackagewherethebugdidn'toccurr\"))

** TODO Basic Usage: INCOMPLETE
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: 5cbdbf0d2015540c59ed8ee0fcf4788effdf75b6

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|ephemeraInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|ephemeraInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|ephemeraInstall (
;;;#+END:
                                           <pkgsProfileSymbol <pkgName &optional <ref)
   " #+begin_org
** TODO DocStr: INCOMPLETE. Install an record.
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

** TODO Basic Usage: INCOMPLETE
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
** TODO DocStr: Based on a default? Using the default pkgsProfileName, install *<pkgName* with straight.
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



;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight:anyProfile|isIn?"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight:anyProfile|isIn?>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight:anyProfile|isIn? (
;;;#+END:
                                        <pkgName <pkgsProfilesList)
   " #+begin_org
** DocStr: Find *<pkgName* in any of *<pkgsProfilesList*, return that profile when found. nil otherwise.
#+end_org "
   (let* (
          ($pkgsList)
          ($pkgInfo)
          ($result nil)
         )
     (loop-for-each  $profileSymb <pkgsProfilesList
       (setq $pkgsList (get $profileSymb ':pkgsList))
       (setq $pkgInfo (assoc <pkgName $pkgsList))
       (when $pkgInfo
         (setq $result $profileSymb)
         (loop-break)))
     $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|anyProfiledInstall b:pkgsProfile:blee3:all \"add-node-modules-path\")
#+END_SRC

#+RESULTS:
: b:pkgsProfile:blee3:doom3

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|anyProfile:install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|anyProfile:install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|anyProfile:install (
;;;#+END:
                                          <pkgName <pkgsProfilesList)
   " #+begin_org
** TODO DocStr: Based on a default? Using the default pkgsProfileName, install *<pkgName* with straight.
#+end_org "
   (let* (
          ($pkgsProfile (b:pkg:straight:anyProfile|isIn? <pkgName <pkgsProfilesList))
          ($result nil)
          )
     (if $pkgsProfile
         (setq $result (b:pkg:straight|profiledInstall <pkgName <pkgsProfilesList))
       (message "<pkgName not found in any")
       )
     $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|anyProfiledInstall b:pkgsProfile:blee3:all \"add-node-modules-path\")
#+END_SRC

#+RESULTS:
: b:pkgsProfile:blee3:doom3

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
           pkg:straight:explicit:info))

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
       (b:pkgsProfile:file:read|prepare $profileSymb)
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
(provide 'pkgs-profile)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
