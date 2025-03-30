import {RowDataPacket} from "mysql2";

export interface IBook extends RowDataPacket {
    id: string,
    title: string,
    year: number,
    name: string | string[],
    total: number,
}

export interface IBookComplete extends RowDataPacket, IBook {
    clicks: number,
}

export interface ISingleBook extends RowDataPacket, IBook {
    pages: number,
    isbn: string,
    description: string,
}

export type IStats = RowDataPacket & {
    [key in "clicks" | "views"]: number;
};

export interface IAuthorId extends RowDataPacket {
    id: string,
}