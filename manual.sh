#!/usr/bin/env bash

root_path=$(dirname $(realpath $0))
root_name=$(basename $root_path)

function rustup_target_install() {
    local t=${1:?''}

    local c=`rustup target list | grep -co "$t"`

    if (( 0 < $c )); then
        return
    fi

    rustup target add $t
}

args_riscX=riscv64
args_target='riscv64gc-unknown-none-elf'

rustup_target_install $args_target

cargo build

rust-objcopy --binary-architecture=$args_riscX \
target/$args_target/debug/rsos \
--strip-all -O binary target/$args_target/debug/rsos.bin

qemu-system-$args_riscX \
-machine virt \
-nographic \
-bios fw_jump.bin \
-device loader,file=target/$args_target/debug/rsos.bin,addr=0x80200000
