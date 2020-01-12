import Branch from "./branch";
import { anyone } from "./accessability";

class BranchType {

    @anyone()
    id: String;

    @anyone()
    name: String;

    @anyone()
    branches: Array<Branch>

    constructor(id: String, name: String, branches: Array<Branch>) {
        this.id = id;
        this.name = name;
        this.branches = branches;
    }
}

export default BranchType