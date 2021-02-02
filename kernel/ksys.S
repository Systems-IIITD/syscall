#include <linux/linkage.h>
#include <asm/segment.h>

# syscall_handler_k routine in klib.c implements the actual system
# call handler. The arguments to syscall_handler_k are passed on the
# stack. Kernel uses __KERNEL_PERCPU and __KERNEL_STACK_CANARY for
# %fs and %gs that may be different from user applications.
# Kernel uses __USER_DS for %ds and %es.
# You can assume that user and kernel use the same %ds and %es.

#void syscall_handler_k(int id, void *arg);

# Save the caller-saved registers.
# Save the user's %fs register.
# set %fs to constant __KERNEL_PERCPU.
# (e.g. mov $(__KERNEL_PERCPU), %eax moves the const to eax).
# Save the user's %gs register.
# set %gs to constant __KERNEL_STACK_CANARY.
# pass user's arguments to syscall_handler_k
# restore %fs, %gs and caller-saved registers.
# return to user-mode.

#system call handler
ENTRY(syscall_handler)

# write some code here

call syscall_handler_k

# write some code here

iret
ENDPROC(syscall_handler)
