#!/usr/bin/env node
const utils = require('corifeus-utils');
const fs = require('mz/fs');

const start = async () => {
    const results = await Promise.all(
        [
            fs.readFile(`${__dirname}/../router/rpi-3/opkg-list-installed-mine.txt`),
            fs.readFile(`${__dirname}/../router/rpi-3/opkg-list-installed-his.txt`),
        ]
    )
    const myPkg = results[0].toString().split(' ').sort();
    myPkg.shift();
    const hisPkg = results[1].toString().split(' ').sort();
    let final = [];
    myPkg.forEach(pkg => {
        if (hisPkg.includes(pkg)) {
            final.push(pkg)
        }
    })
    hisPkg.forEach(pkg => {
        if (!final.includes(pkg)) {
            final.push(pkg)
        }
    })
    myPkg.forEach(pkg => {
        if (!final.includes(pkg)) {
            final.push(pkg)
        }
    })
    final = final.sort();
//    console.log(final.join(' '))

    const missing = [];
    final.forEach(pkg => {
        if (!myPkg.includes(pkg)) {
            missing.push(pkg)
        }
    })
    console.log(missing.join('\n'))
}

start();