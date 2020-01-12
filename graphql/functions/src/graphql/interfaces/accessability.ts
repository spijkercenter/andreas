import 'reflect-metadata';

const accessibiltyKey = Symbol("accessibility");

export function anyone() {
    return Reflect.metadata(accessibiltyKey, () => true);
};