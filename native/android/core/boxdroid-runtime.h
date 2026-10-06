#ifndef BOXDROID_RUNTIME_H
#define BOXDROID_RUNTIME_H

/* Single-run embedded QEMU lifecycle. A fresh Android process is required
 * before initialize() can be called again. */
int boxdroid_runtime_initialize(const char *guest_path,
                                const char *serial_path,
                                const char *trace_path);
int boxdroid_runtime_run(void);
void boxdroid_runtime_request_shutdown(void);

#endif
