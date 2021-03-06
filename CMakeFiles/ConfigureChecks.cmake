# Detect curses.
INCLUDE(FindCurses)

# Get threads.
set(THREADS_PREFER_PTHREAD_FLAG ON)
FIND_PACKAGE(Threads REQUIRED)

IF(APPLE)
  # 10.7+ only.
  SET(CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS} "-Werror=unguarded-availability")
ENDIF()

# Set up the config.h file.
SET(PACKAGE_NAME "fish")
SET(PACKAGE_TARNAME "fish")
INCLUDE(CheckFunctionExists)
INCLUDE(CheckSymbolExists)
INCLUDE(CheckIncludeFiles)
INCLUDE(CheckStructHasMember)
INCLUDE(CheckCXXSourceCompiles)
INCLUDE(CheckTypeSize)
CHECK_FUNCTION_EXISTS(backtrace_symbols HAVE_BACKTRACE_SYMBOLS)
CHECK_FUNCTION_EXISTS(clock_gettime HAVE_CLOCK_GETTIME)
CHECK_FUNCTION_EXISTS(ctermid_r HAVE_CTERMID_R)
CHECK_INCLUDE_FILES(curses.h HAVE_CURSES_H)
CHECK_STRUCT_HAS_MEMBER(dirent d_type dirent.h HAVE_STRUCT_DIRENT_D_TYPE)
CHECK_FUNCTION_EXISTS(dirfd HAVE_DIRFD)
CHECK_INCLUDE_FILES(execinfo.h HAVE_EXECINFO_H)
CHECK_FUNCTION_EXISTS(flock HAVE_FLOCK)
# futimens is new in OS X 10.13 but is a weak symbol.
# Don't assume it exists just because we can link - it may be null.
CHECK_SYMBOL_EXISTS(futimens sys/stat.h HAVE_FUTIMENS)
CHECK_FUNCTION_EXISTS(futimes HAVE_FUTIMES)
CHECK_FUNCTION_EXISTS(getifaddrs HAVE_GETIFADDRS)
CHECK_INCLUDE_FILES(getopt.h HAVE_GETOPT_H)
CHECK_FUNCTION_EXISTS(getpwent HAVE_GETPWENT)
CHECK_FUNCTION_EXISTS(gettext HAVE_GETTEXT)
CHECK_INCLUDE_FILES(inttypes.h HAVE_INTTYPES_H)
CHECK_FUNCTION_EXISTS(killpg HAVE_KILLPG)
CHECK_INCLUDE_FILES(libintl.h HAVE_LIBINTL_H)
CHECK_FUNCTION_EXISTS(lrand48_r HAVE_LRAND48_R)
CHECK_INCLUDE_FILES(memory.h HAVE_MEMORY_H)
CHECK_FUNCTION_EXISTS(mkostemp HAVE_MKOSTEMP)
SET(HAVE_CURSES_H ${CURSES_HAVE_CURSES_H})
SET(HAVE_NCURSES_CURSES_H ${CURSES_HAVE_NCURSES_CURSES_H})
SET(HAVE_CURSES_H ${CURSES_HAVE_CURSES_H})
SET(HAVE_NCURSES_H ${CURSES_HAVE_NCURSES_H})
CHECK_INCLUDE_FILES("ncurses/term.h" HAVE_NCURSES_TERM_H)
CHECK_FUNCTION_EXISTS(DIR HAVE_NDIR_H)
CHECK_FUNCTION_EXISTS(shm_open HAVE_SHM_OPEN)
CHECK_INCLUDE_FILES(siginfo.h HAVE_SIGINFO_H)
CHECK_INCLUDE_FILES(spawn.h HAVE_SPAWN_H)
CHECK_INCLUDE_FILES(stdint.h HAVE_STDINT_H)
CHECK_INCLUDE_FILES(stdlib.h HAVE_STDLIB_H)
CHECK_FUNCTION_EXISTS(std::wcscasecmp HAVE_STD__WCSCASECMP)
CHECK_FUNCTION_EXISTS(std::wcsdup HAVE_STD__WCSDUP)
CHECK_FUNCTION_EXISTS(std::wcsncasecmp HAVE_STD__WCSNCASECMP)
CHECK_INCLUDE_FILES(strings.h HAVE_STRINGS_H)
CHECK_INCLUDE_FILES(string.h HAVE_STRING_H)
CHECK_INCLUDE_FILES(stropts.h HAVE_STROPTS_H)
CHECK_FUNCTION_EXISTS(struct dirent HAVE_STRUCT_DIRENT_D_TYPE)
CHECK_FUNCTION_EXISTS(struct stat HAVE_STRUCT_STAT_ST_CTIME_NSEC)
CHECK_FUNCTION_EXISTS(struct stat HAVE_STRUCT_STAT_ST_MTIMESPEC_TV_NSEC)
CHECK_FUNCTION_EXISTS(struct stat HAVE_STRUCT_STAT_ST_MTIM_TV_NSEC)
CHECK_SYMBOL_EXISTS(sys_errlist stdio.h HAVE_SYS_ERRLIST)
CHECK_INCLUDE_FILES(sys/ioctl.h HAVE_SYS_IOCTL_H)
CHECK_INCLUDE_FILES(sys/resource.h HAVE_SYS_RESOURCE_H)
CHECK_INCLUDE_FILES(sys/select.h HAVE_SYS_SELECT_H)
CHECK_INCLUDE_FILES(sys/stat.h HAVE_SYS_STAT_H)
CHECK_INCLUDE_FILES(sys/sysctl.h HAVE_SYS_SYSCTL_H)
CHECK_INCLUDE_FILES(sys/types.h HAVE_SYS_TYPES_H)
CHECK_INCLUDE_FILES(termios.h HAVE_TERMIOS_H)
CHECK_INCLUDE_FILES(term.h HAVE_TERM_H)
CHECK_INCLUDE_FILES(unistd.h HAVE_UNISTD_H)
CHECK_FUNCTION_EXISTS(wcscasecmp HAVE_WCSCASECMP)
CHECK_FUNCTION_EXISTS(wcsdup HAVE_WCSDUP)
CHECK_FUNCTION_EXISTS(wcslcpy HAVE_WCSLCPY)
CHECK_FUNCTION_EXISTS(wcsncasecmp HAVE_WCSNCASECMP)
CHECK_FUNCTION_EXISTS(wcsndup HAVE_WCSNDUP)
CHECK_SYMBOL_EXISTS(_nl_msg_cat_cntr stdlib.h HAVE__NL_MSG_CAT_CNTR)
CHECK_SYMBOL_EXISTS(_sys_errs stdlib.h HAVE__SYS__ERRS)

SET(CMAKE_EXTRA_INCLUDE_FILES termios.h sys/ioctl.h)
CHECK_TYPE_SIZE("struct winsize" STRUCT_WINSIZE)
CHECK_SYMBOL_EXISTS("TIOCGWINSZ" "termios.h sys/ioctl.h" HAVE_TIOCGWINSZ)
IF(${STRUCT_WINSIZE} AND (DEFINED HAVE_TIOCGWINSZ))
  SET(HAVE_WINSIZE 1)
ENDIF()
SET(CMAKE_EXTRA_INCLUDE_FILES)

SET(HAVE__PROC_SELF_STAT (EXISTS "/proc/self/stat"))
CHECK_TYPE_SIZE("wchar_t[8]" WCHAR_T_BITS)
