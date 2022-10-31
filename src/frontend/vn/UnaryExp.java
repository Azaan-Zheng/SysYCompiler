package frontend.vn;

import error.Error;
import error.ErrorType;
import frontend.symbol.Symbol;
import frontend.symbol.SymbolFuncType;
import frontend.symbol.SymbolKind;
import frontend.symbol.SymbolTable;
import frontend.token.Token;
import frontend.token.TokenType;

public class UnaryExp extends Vn{

    public UnaryExp(){
        super("<frontend.vn.UnaryExp>");
    }
    public int RUnaryExp(){
        int ret = 0;
        Token token = Token.nextToken();
        if(token.isType(TokenType.PLUS) || token.isType(TokenType.MINU) || token.isType(TokenType.NOT)){
            Token.retractToken();
            UnaryOp unaryOp = new UnaryOp();
            unaryOp.RUnaryOp();
            this.addVn(unaryOp);
            UnaryExp unaryExp = new UnaryExp();
            unaryExp.RUnaryExp();
            this.addVn(unaryExp);
        } else {
            Token token1 = Token.nextToken();
            if(token.isType(TokenType.IDENFR) && token1.isType(TokenType.LPARENT)){
                this.addToken(token);
                this.addToken(token1);
                int line = token.getLine();
                token = Token.nextToken();

                if((!token.isType(TokenType.RPARENT)) && (!token.isType(TokenType.SEMICN))){
                    Token.retractToken();
                    FuncRParams funcRParams = new FuncRParams();
                    funcRParams.RFuncRParams();
                    this.addVn(funcRParams);
                    line = funcRParams.getEndLine();
                    token = Token.nextToken();
                }
                if(token.isType(TokenType.RPARENT)){
                    this.addToken(token);
                } else {
                    Token.retractToken();
                    Error.addError(new Error(line, ErrorType.LACK_RPARENT));
                    this.addToken(new Token(line, TokenType.RPARENT, TokenType.RPARENT.getWord()));
                    ret = -1;
                }
            } else {
                Token.retractToken();
                Token.retractToken();
                PrimaryExp primaryExp = new PrimaryExp();
                primaryExp.RPrimaryExp();
                this.addVn(primaryExp);
            }
        }
        return ret;
    }

    public int RAnalysis(SymbolTable symbolTable){
        int ret = 0;
        Vn vn0 = vns.get(0);
        if(vn0.isVt){
            Symbol symbol = symbolTable.getSymbol(vn0.getToken().getValue(), SymbolKind.FUNC);
            if(symbol == null){
                Error.addError(new Error(vn0.getEndLine(), ErrorType.NAME_UNDEFINE));
            } else {
                Vn vn2 = vns.get(2);
                if(vn2 instanceof FuncRParams){
                    int cnt = 0;
                    for(Vn vn:vn2.vns){
                        if(vn instanceof Exp){
                            cnt++;
                        }
                    }
                    if(cnt != symbol.getFuncFParamNum()){
                        Error.addError(new Error(vn0.getEndLine(), ErrorType.FUNCPARA_NUMBER));
                        ret = -1;
                    } else {
                        int i = 0;
                        for(Vn vn:vn2.vns){
                            if(vn instanceof Exp){
                                if(vn.RAnalysis(symbolTable, symbol.getFuncPara(i)) == -2){
                                    Error.addError(new Error(vn0.getEndLine(), ErrorType.FUNCPARA_TYPE));
                                    ret = -1;
                                }
                                i++;
                            }
                        }
                    }
                } else {
                    if(symbol.getFuncFParamNum() > 0){
                        Error.addError(new Error(vn0.getEndLine(), ErrorType.FUNCPARA_NUMBER));
                        ret = -1;
                    }
                }

            }
        } else {
            for(Vn vn:vns){
                if(!vn.isVt){
                    if(vn.RAnalysis(symbolTable) == -1){
                        ret = -1;
                    }
                }
            }
        }
        return ret;
    }

    @Override
    public int RAnalysis(SymbolTable symbolTable, Symbol symbol) {
        int ret = 0;
        Vn vn0 = this.vns.get(0);
        if(vn0.isVt){
            if(symbol.isArray()){
                ret = -2;
            } else {
                ret = this.RAnalysis(symbolTable);
                if(ret == 0){
                    Vn vn2 = this.vns.get(2);
                    if(vn2 instanceof FuncRParams){
                        for(Vn vn:vn2.vns){
                            if(!vn.isVt){
                                int retmp = vn.RAnalysis(symbolTable);
                                if(retmp < 0){
                                    ret = retmp;
                                }
                            }
                        }
                    }
                    Symbol s = symbolTable.getSymbol(vn0.getToken().getValue(), SymbolKind.FUNC);

                    if(s.getFuncType().isFuncType(SymbolFuncType.VOID)){
                        ret = -2;
                    }
                }
            }
        } else if(vn0 instanceof PrimaryExp){
            ret = vn0.RAnalysis(symbolTable, symbol);
        } else {
            if(symbol.isArray()){
                ret = -2;
            } else {
                for(Vn vn:vns){
                    if(!vn.isVt){
                        int retmp = vn.RAnalysis(symbolTable,symbol);
                        if(retmp < 0){
                            ret = retmp;
                        }
                    }
                }
            }
        }
        return ret;
    }
}
