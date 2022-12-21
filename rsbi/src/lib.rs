//! https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc

#![no_std]

pub struct SbiRet{
    pub error: SbiRetErr,
    pub value: isize,
}

pub enum SbiRetErr {
    SbiSuccess = 0,
    SbiErrFailed = -1,
    SbiErrNotSupported = -2,
    SbiErrInvalidParam = -3,
    SbiErrDenied = -4,
    SbiErrInvalidAddress = -5,
    SbiErrAlreadyAvailable = -6,
    SbiErrAlreadyStarted = -7,
    SbiErrAlreadyStopped = -8,
}

#[no_mangle]
pub fn trace() {

}
