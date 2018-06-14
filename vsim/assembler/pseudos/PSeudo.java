package vsim.assembler.pseudos;

import java.util.ArrayList;
import vsim.assembler.statements.Statement;


public abstract class PSeudo {

  private String name;

  public PSeudo(String name) {
    this.name = name;
  }

  public abstract ArrayList<Statement> build();

  public String getName() {
    return this.name;
  }

}
